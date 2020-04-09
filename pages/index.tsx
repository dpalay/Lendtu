import {NextPage} from 'next';
import MainLayout from '../components/MainLayout';

export const config = { amp: true };

const Index: NextPage = () => (
    <MainLayout>
        <div>Hi there</div>
    </MainLayout>
)

export default Index;