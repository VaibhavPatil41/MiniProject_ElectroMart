import './style.css'

import { useNavigate } from "react-router-dom";

const { useReducer, useState } = require("react");

export default function  RegiStration(){
    
    const init = {
        name :   {value:"",valid:false , touched:false , error:""},
        address :   {value:"",valid:false , touched:false , error:""},
        email_id :  {value:"",valid:false , touched:false , error:""},
        date_of_birth : {value:"",valid:false , touched:false , error:""},
        gender :    {value:"",valid:false , touched:false , error:""},
        mobile_num: {value:"",valid:false , touched:false , error:""},
        role:       {value:"",valid:false , touched:false , error:""},
        password:   {value:"",valid:false , touched:false , error:""}
    }

    const reducer = (state,action) => {
        switch(action.type)
        {
            case 'update':
               
                const {key,value,touched,valid,error,formValid} = action.data;
                return {...state,[key]:{value,touched,valid,error},formValid}
            
            case 'reset':
                return init;        
        }
    }

    const[user,dispatch]=useReducer(reducer,init)
    const[msg,setMsg]=useState("")

    var navigate=useNavigate();
    const validateData = (key,val) => {
        let valid = true;
        let error = ""
        switch(key)
        {
            case 'name':
                var pattern = /^[A-Z]{1}[a-z]{1,} [A-Z]{1}[a-z]{1,}$/ 
                if(!pattern.test(val))
                {
                    valid = false;
                    error = "First Letter of Name and Surname Should be Capital "
                }
                break;
            
            case 'password':
                var pattern = /^[\w]{8,15}$/ 
                if(!pattern.test(val))
                {
                    valid = false;
                    error = "Password Size 8-15"
                }
                break;

            case 'email_id':
                var pattern = /^[\w.#-]{4,20}@[\w-]{5,15}\.[a-z]{2,3}$/ 
                if(!pattern.test(val))
                {
                    valid = false;
                    error = "Please Enter valid Email"
                }
                break;

        }
        return { valid: valid, error: error}
    }


    const handleChange = (key,value) => {
       
        const {valid, error} = validateData(key,value);

       
        let formValid = true;
        for(let k in user)
        {
           
            if(user[k].valid === false)
            {
                formValid = false;
                break;
            }
        }
        
        console.log(formValid);
        console.log("------");

       
        dispatch({type: "update",data:{key,value,touched:true,valid,error,formValid}})
    }

    const submitData = (e) =>{
        e.preventDefault();
       
    

    
        const reqOption={
            method:"POST",
            headers:{'content-type':'application/json'},
            body:JSON.stringify({
                
                name : user.name.value,
                address : user.address.value,
                email_id : user.email_id.value,
                date_of_birth : user.date_of_birth.value,
                gender : user.gender.value,
                mobile_num : user.mobile_num.value,
                role : user.role.value,
                password : user.password.value
            })
        };
    
        fetch("http://localhost:9000/reg",reqOption)
        .then(resp => resp.text())
        .then(str => {
            if(str=="true")
            {
                navigate('/login');
            }
            return setMsg(str)
        })
        
        

    }
    

    return(
        
            <div className='container-lg'>
                     <div class="container-fluid pt-3 mt-2 ele">
      <h1 class="pb-3 0 mx-5">Registration Form</h1>
      <form class="row g-3">
        <div class="col-md-5">
          <label for="inputEmail4" class="form-label">Name</label>
          <input type="text" class="form-control" id="inputEmail4" name="name" value={user.name.value}
                onChange={(e)=>{handleChange("name",e.target.value)}} />
                 <div style={{ display: (!user.name.valid)  ?"block":"none"}}>
                    {user.name.error}
                </div>
        </div>
        <div class="col-md-5">
          <label for="inputEmail4" class="form-label">Email</label>
          <input type="email" class="form-control" id="inputEmail4" name="email_id" value={user.email_id.value}
                onChange={(e)=>{handleChange("email_id",e.target.value)}} />
                <div style={{ display: (!user.email_id.valid)  ?"block":"none"}}>
                    {user.email_id.error}
                </div>
        </div>
        <div class="col-8">
          <label for="inputAddress" class="form-label">Address</label>
          <input type="text" class="form-control" id="inputAddress" name="address" value={user.address.value}
                onChange={(e)=>{handleChange("address",e.target.value)}} />
        </div>
        <div class="col-md-5">
          <label for="inputPassword4" class="form-label">Date of Birth</label>
          <input type="date" class="form-control" id="inputPassword4" name="date_of_birth" value={user.date_of_birth.value}
                onChange={(e)=>{handleChange("date_of_birth",e.target.value)}} />
        </div>
        
          
        <label for="inputEmail4" class="form-label">Gender</label>
        <div class="form-check ">
          <input class="form-check-input" type="radio"  id="inlineRadio1" name="gender" value="M"
                onChange={(e)=>{handleChange("gender",e.target.value)}}/>
          <label class="form-check-label" for="inlineRadio1">Male</label>
        </div>
        <div class="form-check ">
          <input class="form-check-input" type="radio"  id="inlineRadio2" name="gender" value="F"
                onChange={(e)=>{handleChange("gender",e.target.value)}}/>
          <label class="form-check-label" for="inlineRadio2">Female</label>
        </div>
        <div class="col-md-5">
          <label for="inputEmail4" class="form-label">Mobile Number</label>
          <input type="number" class="form-control" id="inputEmail4" name="mobile_num" value={user.mobile_num.value}
                onChange={(e)=>{handleChange("mobile_num",e.target.value)}} />
        </div>
        <div class="col-md-4">
          <label for="inputState" class="form-label">Role</label>
          <select id="inputState" class="form-select" name="role" value={user.role.value}
                onChange={(e)=>{handleChange("role",e.target.value)}}>
            <option selected>Choose...</option>
            <option>Admin</option>
            <option>Vendor</option>
            <option>Customer</option>
          </select>
        </div>
        <div class="row-md-2">
          <div class="col-5">
            <label for="inputPassword4" class="form-label">Password</label>
          <input type="password" class="form-control" id="inputPassword4" name="password" value={user.password.value}
                onChange={(e)=>{handleChange("password",e.target.value)}}/>
                <div style={{ display: (!user.password.valid)  ?"block":"none"}}>
                    {user.password.error}
                </div>
          </div>
          </div>
        <div class="col-12 mt-3">
        <input type="submit" class="btn btn-primary mx-2" value="Sign Up"
                disabled={!user.formValid} 
                onClick={(e)=>{submitData(e)}} />
        </div>
      </form>
    </div>
            </div>
    )

} 