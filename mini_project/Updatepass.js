import React, { useReducer, useState } from "react";

import { useNavigate } from "react-router-dom";

const init = {
    email_id: "",

    password_new: ""
}

const reducer = (state, action) => {

    switch (action.type) {
        case 'update':
            return { ...state, [action.fld]: action.val }
        // case 'reset' :
        //     return init;
    }
}

export default function UpdatePass() {
    const [user, dispatch] = useReducer(reducer, init);
    const [flag, setFlag] = useState(false);

    var navigate = useNavigate();
    const [msg, setMsg] = useState("")




    //////////////////////////////

    const submitData = (e) => {
        e.preventDefault();
        //server side API


        const reqOption = {
            method: "POST",
            headers: { 'content-type': 'application/json' },
            body: JSON.stringify({
                email_id: user.email_id,

                password_new: user.password_new
            })

        };

        fetch("http://localhost:9000/update", reqOption)
            .then(resp => resp.text())
            .then(str => {

                if (str == "true") {
                    alert("Password Updated !")
                    navigate('/cushome');
                }
                return setMsg(str)
            })


    }


    return (
        <div class="container">
            <form >
                <h1 style={{ color: 'rgb(56, 93, 118)' }}>Update Password</h1>
                <div class="col-5">
                    Email: <input type="text" name="email_id" class="form-control" aria-describedby="emailHelp"
                        value={user.email_id}
                        onChange={(e) => {
                            dispatch({ type: "update", fld: "email_id", val: e.target.value })
                        }} />
                </div>
                
                <div class="col-5 mt-3">
                    New Password : <input type="password" name="password_new" class="form-control" aria-describedby="emailHelp"
                        value={user.password_new}
                        onChange={(e) => { dispatch({ type: "update", fld: "password_new", val: e.target.value }) }} />
                </div>
                

                <input type="submit" value="Update" class="btn btn-outline-primary mt-3"
                    onClick={(e) => { submitData(e); {/* alert(msg);setMsg("");*/ } }} />

                {/* onClick={(e)=>{e.preventDefault(); 
                    console.log(JSON.stringify(user)); setFlag(true);}} /> */}

                {/* <p>{JSON.stringify(info)}</p> */}
                {/* <div id="show" style={{display:flag?"block":"none"}}> */}
                <div >
                    {/* <p>name : {user.email_id}</p>:
                    <p>New Password: {user.password_new}</p> */}


                </div>
            </form>
        </div>

    )
}
