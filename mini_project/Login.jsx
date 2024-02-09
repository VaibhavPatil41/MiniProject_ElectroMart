
export default function Login(){
    return(
        <div class="container mt-2 pt-5 item-align-center">
        <h1>Login Details</h1>
        <form>
            <div class="mb-3 col-5">
              <label for="exampleInputEmail1" class="form-label">Username</label>
              <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"/>
              <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
            </div>
            <div class="mb-3 col-5">
              <label for="exampleInputPassword1" class="form-label">Password</label>
              <input type="password" class="form-control" id="exampleInputPassword1"/>
            </div>
            
            <button  type="submit" class="btn btn-primary">Submit</button>
          </form>

    </div>
    )
}