import { IRouterConfig, lazy } from 'ice';

const Home = lazy(() => import('@/pages/Home'));

const routerConfig: IRouterConfig[] = [
  {
    path: '/',
    exact: true,
    redirect: '/home',
    component: Home,
  },
  {
    path: '/home',
    component: Home,
  },
];

export default routerConfig;
