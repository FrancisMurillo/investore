import { createMuiTheme } from "@material-ui/core/styles";
import MuiThemeProvider from "@material-ui/core/styles/MuiThemeProvider";
import { ThemeProvider } from "emotion-theming";
import React from "react";
import { BrowserRouter as RoutingProvider } from "react-router-dom";

import environment from "./Environment";

const theme = {
  primary: {
    main: "#439b18",
    light: "#439b18",
    dark: "#439b18"
  },
  secondary: {
    main: "#0079ff",
    light: "#2699fb",
    dark: "#0079ff"
  },
  tertiary: {
    main: "#ff6565",
    light: "#ff6565",
    dark: "#ff6565"
  },
  background: {
    main: "#efefef",
    light: "#f3f3f3",
    dark: "#e1e1e1",
    white: "#ffffff",
    disabled: "#bcbccb"
  },
  font: {
    fontFamily: "Arial",
    body1: 12,
    body2: 14,
    caption: 10,
    label: 16,
    title: 18,
    headline: 38
  },
  fontColor: {
    white: "#ffffff",
    main: "#1d1d1d",
    light: "#7f7f7f",
    dark: "#4f4f4f"
  },
  border: {
    active: "#bce0fd",
    inactive: "rgba(210,210,210,0.61)",
    disabled: "#bcbccb"
  },
  shadow: "rgba(0,0,0,0.16)",
  error: "#f44336"
};

const materialTheme = createMuiTheme({
  palette: {
    primary: {
      main: "#439b18"
    },
    secondary: {
      main: "#0079ff"
    }
  },
  typography: {
    useNextVariants: true
  }
});

export default ({ children }) => (
  <MuiThemeProvider theme={materialTheme}>
    <ThemeProvider theme={materialTheme}>
      <RoutingProvider>{React.Children.only(children)}</RoutingProvider>
    </ThemeProvider>
  </MuiThemeProvider>
);
