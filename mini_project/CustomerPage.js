import pic from '../components/Laptop.jpg'
import pic2 from '../components/iPhone.jpg'
import pic3 from '../components/Tablet.jpg'
import pic4 from '../components/Tv.jpg'

export const CustomerUI =()=>{

  return(
    <div class="container-fluid">
    <header class="text-center bg-dark text-white">
      <h1 class="mt-0">Welcome to Electronic Products Store Electro Mart</h1>
      <nav class="navbar navbar-expand-lg navbar-dark">
        <ul class="navbar-nav">
          <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
          <li class="nav-item"><a class="nav-link" href="#">Products</a></li>
          <li class="nav-item"><a class="nav-link" href="/Logout">Logout</a></li>
          <li class="nav-item"><a class="nav-link" href="/update">UpdatePassword</a></li>
        </ul>
      </nav>
    </header>

    <main>
      <section class="featured-products text-center mt-4">
        <h2 class="bg-secondary text-white">Featured Products</h2>
        <div class="row">
          <div class="col-md-6">
            <div class="card">
              <img src={pic} class="card-img-top" alt="Product 1" height={400}/>
              <div class="card-body">
                <h3 class="card-title">HP VICTUS</h3>
                <p class="card-text">Hp Laptop Victus Ryzen-5 500gb-SSD 8Gb-RAM 4Gb-Graphics</p>
                <button class="btn btn-primary">Add to Cart</button>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="card">
              <img src={pic2} class="card-img-top" alt="Product 2" height={400}/>
              <div class="card-body">
                <h3 class="card-title">IPHONE</h3>
                <p class="card-text">IPhone 12</p>
                <button class="btn btn-primary">Add to Cart</button>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section class="new-arrivals text-center mt-4">
        <div class="row">
          <div class="col-md-6">
            <div class="card">
              <img src={pic3} class="card-img-top" alt="Product 3" height={400}/>
              <div class="card-body">
                <h3 class="card-title">Samsung Tablet</h3>
                <p class="card-text">Samsung s6-Lite With Sim Card Feature</p>
                <button class="btn btn-primary">Add to Cart</button>
              </div>
            </div>
          </div>

          <div class="col-md-6">
            <div class="card">
              <img src={pic4} class="card-img-top" alt="Product 4" height={400}/>
              <div class="card-body">
                <h3 class="card-title">Sony</h3>
                <p class="card-text">Sony LedTv 43inch</p>
                <button class="btn btn-primary">Add to Cart</button>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>

    <footer class="text-center mt-4">
      <p>&copy; Sep:2023 Electro Mart.</p>
    </footer>
  </div>
  )
}
