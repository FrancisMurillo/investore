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
import {
  compose,
  flattenProp,
  onlyUpdateForKeys,
  pure,
  withHandlers,
  withProps,
  withState
} from "recompose";

import environment from "../../Environment";
import baseRoute from "./Route";

const Header = pure(() => (
  <AppBar color={"primary"} position={"fixed"}>
    <Typography variant={"h6"} color={"textPrimary"}>
      Investore
    </Typography>
  </AppBar>
));

const Search = compose(
  withStyles({
    textField: {
      width: 200
    }
  }),
  withHandlers({
    handleChange: ({ onSearch }) => event => {
      onSearch(event.target.value);
    }
  })
)(({ classes, handleChange }) => (
  <FlexView>
    >
    <TextField
      id={"search"}
      label="Name"
      className={classes.textField}
      onChange={handleChange}
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
  <Card className={classes.card}>
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
  </Card>
));

const query = graphql`
  query landingQuery($searchQuery: String!) {
    searchProducts(searchQuery: $searchQuery) {
      name
      description
      imageUrl
    }
  }
`;

const ProductList = compose(
  onlyUpdateForKeys(["searchQuery"]),
  withStyles({
    gridList: {
      flexWrap: "wrap",
      transform: "translateZ(0)"
    }
  })
)(({ classes, searchProducts: products, searchQuery }) => (
  <FlexView column>
    <QueryRenderer
      environment={environment}
      query={query}
      variables={{ searchQuery }}
      render={({ error, props }) => {
        if (error) {
          return (
            <Typography>
              There was an error getting the catalog. Mind if you try again
              later?
            </Typography>
          );
        } else if (!props) {
          return <CircularProgress size={100} />;
        } else if (!props.searchProducts.length) {
          return <Typography>No products found</Typography>;
        } else {
          return (
            <GridList className={classes.gridList} cellHeight={300} cols={3}>
              {props.searchProducts.map(product => (
                <GridListTile key={product.name}>
                  <Product key={product.name} {...product} />
                </GridListTile>
              ))}
            </GridList>
          );
        }
      }}
    />
  </FlexView>
));

const Screen = withState("searchQuery", "setSearchQuery", "")(
  ({ searchQuery, setSearchQuery }) => (
    <FlexView column>
      <Header />
      <Search onSearch={setSearchQuery} />
      <ProductList searchQuery={searchQuery} />
    </FlexView>
  )
);

export const route = {
  ...baseRoute,
  routeComponent: Route,
  component: Screen
};

export default Screen;
