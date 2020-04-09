import {NextPage} from 'next';
import Link from 'next/link'
import MainLayout from '../components/MainLayout';
import { useState } from 'react';


export const config = { amp: true };


const Index: NextPage = () => {
    const [test, setTest] = useState("test")
    return (
    <MainLayout>
        <div>Hi there {test}</div>
        <Link href="./scan"><a>Click to scan</a></Link>
    </MainLayout>
)}

export default Index;