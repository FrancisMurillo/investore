import React from "react";
import { Route, Switch } from "react-router";

import { route as landingRoute } from "./landing";

const routes = [landingRoute];

export default () => (
  <Switch>
    {routes.map(({ path, routeComponent, component }) =>
      React.createElement(routeComponent || Route, {
        key: path,
        path,
        component
      })
    )}
  </Switch>
);
