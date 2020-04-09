import { useState, useMemo, useEffect } from "react";
import MainLayout from "../components/MainLayout";
import { NextPage } from 'next';

interface Iprops {
  QrOrBar: "QR" | "Bar";
}

const Scanner: NextPage<Iprops> = (props: Iprops) => {

  return (
    <MainLayout>
      <div>
        <a className="button" id="startButton">Start</a>
        <a className="button" id="resetButton">Reset</a>
      </div>

      <div>
        <video id="video" width="300" height="200" style={{border: "1px solid gray"}}></video>
      </div>

      <div id="sourceSelectPanel" style={{display:"none"}}>
        <select id="sourceSelect"></select>
      </div>

      Result: 
      <pre><code id="result"></code></pre>
      <script type="text/javascript" src="https://unpkg.com/@zxing/library@latest"></script>
  <script type="text/javascript" src="/zx.js"></script>
    
    </MainLayout>
  );
};

export default Scanner
