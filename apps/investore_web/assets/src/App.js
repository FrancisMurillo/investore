import React from "react";
import styled from "react-emotion";
import FlexView from "react-flexview";

import AppProvider from "./Provider";
import AppRouting from "./screen/Route";

export default () => (
  <AppProvider>
    <FlexView>
      <AppRouting />
    </FlexView>
  </AppProvider>
);
