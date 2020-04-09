import { NextPage } from "next";
import * as ZXing from "@zxing/library";
import { useState, useMemo, useEffect } from "react";
import MainLayout from "../components/MainLayout";

interface Iprops {
  QrOrBar: "QR" | "Bar";
}

const Scanner: NextPage<Iprops> = (props: Iprops) => {
  const [ZX, setZX] = useState<ZXing.BrowserCodeReader>();
  const [devices, setDevices] = useState<MediaDeviceInfo[]>();
  const [result, setResult] = useState<ZXing.Result>();


  useEffect(() => {
      if(!ZX) setZX(new ZXing.BrowserCodeReader(new ZXing.MultiFormatReader(), 300));
      
      if (!devices && ZX) {
          ZX.listVideoInputDevices()
          .then((devices) => {
              setDevices(devices);
            })
            .catch(console.error);
        } else if (ZX) {
            console.log(devices)
            console.log(ZX)
            console.log(result)
            ZX.decodeFromInputVideoDevice(undefined, "video")
            .then((result) => setResult(result))
            .catch(console.error);
        }
    }, [devices, result, ZX]);
    
  return (
    <MainLayout>
      <div>
        {result && <p>{result.toString()}</p>}
        {!devices && (
          <div>
            Still accessing camera. Have you check your permissions? Do you even
            have a camera?
          </div>
        )}
        {devices && (
          <div>
            <video
              id="video"
              width="300"
              height="400"
              style={{ border: "1px gray solid" }}
            ></video>
          </div>
        )}
      </div>
    </MainLayout>
  );
};

export default Scanner;
