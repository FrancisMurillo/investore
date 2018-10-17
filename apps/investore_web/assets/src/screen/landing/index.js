import { Route } from "react-router-dom";

import baseRoute from "./Route";

const Screen = () => "Kitty";

export const route = {
  ...baseRoute,
  routeComponent: Route,
  component: Screen
};

export default Screen;
