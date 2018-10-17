import React from "react";
import styled from "react-emotion";

import AppProvider from "./Provider";
import AppRouting from "./screen/Route";

export default () => (
  <AppProvider>
    <AppRouting />
  </AppProvider>
);
