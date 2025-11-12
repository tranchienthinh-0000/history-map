import i18n from "i18next";
import { initReactI18next } from "react-i18next";

i18n.use(initReactI18next).init({
  resources: {
    vi: { translation: { home: "Trang chủ", about: "Giới thiệu" } },
    en: { translation: { home: "Home", about: "About" } },
    fr: { translation: { home: "Accueil", about: "À propos" } },
  },
  lng: localStorage.getItem("lang") || "vi",
  fallbackLng: "vi",
  interpolation: { escapeValue: false },
});

export default i18n;
