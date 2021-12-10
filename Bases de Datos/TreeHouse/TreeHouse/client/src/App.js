import './App.css';
import '../node_modules/bootstrap/dist/css/bootstrap.min.css';
import Footer from './Components/Footer/footer.js'
import Cont from './Components/Pages/Home/container.js'
import Navb from './Components/NavBar/nav';
import Rutas from './Components/Rutas';

function App() {
  return (
    <>
    <Navb/>
    <br/>
    <Rutas />
    {/* <Cont/> */}
    <br/>
    <br/>
    <br/>
    <Footer />
    </>
  );
}

export default App;

// import Eventos from "./Components/Eventos";
// import Categoria from "./Components/Categoria";
// import './App.css';

// function App() {
//   return (
//     <div>
//       {/* <Eventos /> */}
//       <Categoria categoria = "Agua"/>
//     </div>
//   );
// }

// export default App;

