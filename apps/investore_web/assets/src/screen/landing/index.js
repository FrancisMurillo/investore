import "typeface-roboto";

import { createStyles, withStyles } from "@material-ui/core";
import AppBar from "@material-ui/core/AppBar";
import Card from "@material-ui/core/Card";
import CardActionArea from "@material-ui/core/CardActionArea";
import CardActions from "@material-ui/core/CardActions";
import CardContent from "@material-ui/core/CardContent";
import CardMedia from "@material-ui/core/CardMedia";
import CircularProgress from "@material-ui/core/CircularProgress";
import GridList from "@material-ui/core/GridList";
import GridListTile from "@material-ui/core/GridListTile";
import TextField from "@material-ui/core/TextField";
import Typography from "@material-ui/core/Typography";
import React from "react";
import styled from "react-emotion";
import FlexView from "react-flexview";
import { QueryRenderer, createFragmentContainer, graphql } from "react-relay";
import { Route } from "react-router-dom";
import { compose, flattenProp, onlyUpdateForKeys, withProps } from "recompose";

import environment from "../../Environment";
import baseRoute from "./Route";

const Header = () => (
  <AppBar color={"primary"} position={"fixed"}>
    <Typography variant={"h6"} color={"textPrimary"}>
      Investore
    </Typography>
  </AppBar>
);

const Search = compose(withStyles({}))(({ classes }) => (
  <FlexView>
    >
    <TextField
      id={"search"}
      label="Name"
      // className={classes.textField}
      // value={this.state.name}
      // onChange={this.handleChange('name')}
      margin={"normal"}
    />
  </FlexView>
));

const Product = compose(
  onlyUpdateForKeys(["name", "description", "imageUrl"]),
  withStyles({
    card: { maxWidth: 200 },
    image: { height: 200 }
  })
)(({ classes, name, description, imageUrl }) => (
  <React.Fragment>
    <CardMedia
      image={imageUrl}
      title={name}
      height={200}
      className={classes.image}
    />
    <Typography variant={"h5"} color={"textPrimary"}>
      {name}
    </Typography>
    <Typography variant={"body1"}>{description}</Typography>
  </React.Fragment>
));

const query = graphql`
  query landingQuery {
    products {
      name
      description
      imageUrl
    }
  }
`;

const ScreenView = withProps({
  flex: 1
})(FlexView);

const ProductList = withStyles({
  gridList: {
    flexWrap: "wrap",
    transform: "translateZ(0)"
  }
})(({ classes, products }) => (
  <QueryRenderer
    environment={environment}
    query={query}
    variables={{}}
    render={({ error, props }) => {
      if (error) {
        return (
          <ScreenView>
            <Typography>
              There was an error getting the catalog. Mind if you try again
              later?
            </Typography>
          </ScreenView>
        );
      } else if (!props) {
        return (
          <ScreenView>
            <CircularProgress size={100} />
          </ScreenView>
        );
      } else {
        return (
          <GridList className={classes.gridList} cellHeight={300}>
            {props.products.map(product => (
              <GridListTile>
                <Product key={product.name} {...product} />
              </GridListTile>
            ))}
          </GridList>
        );
      }
    }}
  />
));

const Screen = _props => (
  <FlexView column>
    <Header />
    <Search />
    <ProductList />
  </FlexView>
);

export const route = {
  ...baseRoute,
  routeComponent: Route,
  component: Screen
};

export default Screen;
