import moment from "moment";
import "./App.css";
import logo from "./logo.svg";

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <h4>{moment().subtract(10, "days").calendar()}</h4>
        <h4>{moment().subtract(10, "days").calendar()}</h4>
        <h4>{moment().subtract(10, "days").calendar()}</h4>
        <img src={logo} className="App-logo" alt="logo" />
        <p> This is app for testing </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
        <h2>This is footer area</h2>
        <h4>{moment().subtract(10, "days").calendar()}</h4>
        <h4>{moment().subtract(10, "days").calendar()}</h4>
        <h4>{moment().subtract(10, "days").calendar()}</h4>
      </header>
    </div>
  );
}

export default App;
