// src/pages/Home.jsx
import { useState } from "react";
import MapView from "../components/MapView";
import Sidebar from "../components/Sidebar";
import FilterPanel from "../components/FilterPanel";
import LoadingSpinner from "../components/LoadingSpinner";
import usePlaces from "../hooks/usePlaces";

export default function Home() {
  const [period, setPeriod] = useState("");
  const [q, setQ] = useState("");
  const { data, loading } = usePlaces(period, q);
  const [selected, setSelected] = useState(null);

  return (
    <div className="home">
      <FilterPanel period={period} setPeriod={setPeriod} q={q} setQ={setQ} />
      {loading && <LoadingSpinner />}
      <MapView data={data} onSelect={setSelected} />
      <Sidebar place={selected} onClose={() => setSelected(null)} />
    </div>
  );
}
