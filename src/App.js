import { useTranslation } from "react-i18next";
import logo from "./logo.svg";
import "./App.css";

function App() {
  const { t, i18n } = useTranslation();

  const changeLanguageHandler = (e) => {
    const languageValue = e.target.value;
    i18n.changeLanguage(languageValue);
  };

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <select
          className="custom-select"
          style={{ width: 200 }}
          onChange={changeLanguageHandler}
        >
          <option value="en">English</option>
          <option value="fr">Français</option>
        </select>
        <p>{t("main.title")}</p>
        <a
          className="App-link"
          href="https://lokalise.com/"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn about Lokalise
        </a>
      </header>
    </div>
  );
}

export default App;
