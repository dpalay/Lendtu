import { NextPage } from "next";
import { PropsWithChildren } from "react";

const MainLayout: React.FC<PropsWithChildren<any>> = (props) => (
    
  <div className="mainApp">
    <main>{props.children}</main>
    <style jsx>{`
    main {
        margin:20px;
        padding 20px;
        border: 1px solid #000;
    }
    `}</style>
  </div>
);

export default MainLayout;
