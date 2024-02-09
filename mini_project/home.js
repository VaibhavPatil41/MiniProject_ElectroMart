import './style.css';
import React,{ useReducer, useState} from "react";
import { useNavigate } from 'react-router-dom';


const init = {
    email_id:"",
    password:""
}



const reducer = (state,action) =>{
    
    switch(action.type) {
        case 'update':
            return {...state,[action.fld]:action.val} 
       //  case 'reset' :
        //     return init;
    }
}

export default function Home() {
    const[user, dispatch] = useReducer(reducer, init);
    const [flag,setFlag] = useState(false);
    var navigate=useNavigate();
    const[msg,setMsg]=useState("")

    const submitData = (e) =>{
        e.preventDefault();
        //server side API

       

        const reqOption={
            method:"POST",
            headers:{'content-type':'application/json'},
            body:JSON.stringify({
                email_id : user.email_id,
                password : user.password
            })
                       
        };
        
        fetch("http://localhost:9000/login",reqOption)
        .then(resp => resp.text())
        .then(str => {
          if(str=="true")
          {
              navigate('/cushome');
          }
          return setMsg(str)
      })
        

    }

    return(
      
    <div class="container">
    <div class="header">
      <b><h1>Welcome to Electro Mart</h1></b>
      <p>Login to your account</p>
    </div>

    <div class="form-container">
      <form>
      <div class="mb-3 col-5">
        <label for="exampleInputEmail1" class="form-label">Username:</label>
        <input type="text" id="username" class="form-control"  aria-describedby="emailHelp" name="email_id" 
                value={user.email_id} 
                onChange={(e)=>{
                    dispatch({ type:"update", fld:"email_id", val:e.target.value })}}/>
        </div>
        <div class="mb-3 col-5">
        <label for="exampleInputPassword1" class="form-label">Password:</label>
        <input type="password" id="password" name="password" class="form-control"
                value={user.password}
                onChange={(e)=>{dispatch({type:"update",fld:"password",val:e.target.value})}}/>
        </div>
       

          <input type="submit" value="Login" class="btn btn-outline-primary"
                onClick={(e)=>{submitData(e);{/* alert(msg);setMsg("");*/}}} />
      </form>
    </div>

    <div class="new-user">
      <p>New user? <a href="/Reg">Register here...</a></p>
    </div>
  </div>

    )
}


