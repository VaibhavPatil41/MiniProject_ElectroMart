// import logo from './logo.svg';
import '../node_modules/bootstrap/dist/css/bootstrap.min.css'
import './App.css';
// import Login from './mini_project/Login';
import MiniProject from './mini_project/Reg';
import Home from './mini_project/home';
import RegiStration from './mini_project/Reg';
import home from './mini_project/home';
import Getusername from './react_routing/get_name';
import Username from './react_routing/local_storage';
import Fetch from './rest_API/assignment1';
import Form from './rest_API/form';
import ValidForm from './rest_API/validfrom';
// import Hello from './components/hello';
// import Logo from './components/logo'
// import Time from './components/time';

// import Table from './components/table';
// import Table6 from './components/table';
// import PropsClasComp from './props/fact';
// import Namesarr from './props/names';
// import EmpDetails from './props/emp';
// import StatefulComp from './state/welcome';
// import ChangeColor from './state/paragraph';
// import Count from './state/count';
// import Form from './handling_forms_and_events/welcome';
// import RegFrom from './handling_forms_and_events/regfrom';
import { Link, Route, Routes } from 'react-router-dom';
import UpdatePass from './mini_project/Updatepass';
import { Logout } from './mini_project/Logout';
import { CustomerUI } from './mini_project/CustomerPage';
// import Home from './react_routing/home';
// import LoginForm from './react_routing/login_form';


function App() {
  return (
    <div >
     {/* <header className="App-header">
    //     <img src={logo} className="App-logo" alt="logo" />
    //   </header> 
     <Table6/>
     <PropsClasComp num="5"/>
     <Namesarr names={['Vaibhav','Varad','King','Chabra']}/>

     <EmpDetails empid="101" name="King" sal="999"/>
      <ChangeColor/>

      <Count/>
      <Form/>

      <RegFrom/>*/}

      {/* <ul className='container-lg pt-3 navbar'>
      <li className='nav-item'><Link to="/Home" >Home</Link></li>
      <li className='nav-item'><Link to="/LoginForm" >Login Form</Link></li>
      </ul>
      

        <Username/>
        <Getusername/>

        <Fetch/>

       <Form/>

       <ValidForm/>
       
      
      

    <ul className='container-lg pt-3 navbar'>
      <li className='nav-item'><Link to="/Home" >Home</Link></li>
      {/* <li className='nav-item'><Link to="/MiniProject" >Login </Link></li>  
      </ul>
      <Routes >
        <Route path='/Home' element={<Home/>}/>
        <Route path='/Loginform' element={<MiniProject/>}/>
      </Routes> 


      
       <MiniProject/>
      */}


      
        <ul className='container-lg pt-3 navbar'>
      {/* <li className='nav-item'><Link to="/" >Login</Link></li>  */}
       {/* <li className='nav-item mx-5'><Link to="/Reg" >Register</Link></li>   */}
      </ul> 
      
       {/* <Routes >
      <Route path='/' element={<Home/>}/>
        <Route path='/Reg' element={<RegiStration/>}/>
      </Routes>   */}

 <div className='nav navbar container'>
        {/* <ul className='nav navbar container' style={{ backgroundColor: 'grey' }}> 
          <li className='nav-item'><Link to="/home" > Home </Link></li>
          <li className='nav-item'><Link to="/reg">Register</Link></li>
          <li className='nav-item'><Link to="/login" > Login </Link></li>
          <li className='nav-item'><Link to="/update" > Update password </Link></li>
          <li className='nav-item'><Link to="/Logout" > Log Out </Link></li>
         </ul> */}
      </div> 
        
      <Routes>
        <Route path="/" element={<Home/>}/>

         <Route path="/reg" element={<RegiStration/>} />
        <Route path="/login" element={<Home/> } /> 
        <Route path="/update" element={<UpdatePass/>} />
        <Route path="/Logout" element={<Logout/>} /> 
        <Route path="/cushome" element={<CustomerUI/>} />
        {/* <RegiStration/>
        <Home/>
        <UpdatePass/>
        <Logout/>
    <CustomerUI/> */}

      </Routes>

     
      

      </div>
    
  );
}

export default App;
