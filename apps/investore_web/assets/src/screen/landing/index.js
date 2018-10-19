import React from "react";
import { QueryRenderer, graphql } from "react-relay";
import { Route } from "react-router-dom";

import environment from "../../Environment";
import baseRoute from "./Route";

const query = graphql`
  query landingQuery {
    products {
      name
      description
      imageUrl
    }
  }
`;

const Screen = () => (
  <QueryRenderer
    environment={environment}
    query={query}
    variables={{}}
    render={({ error, props }) => {
      if (error) {
        return <div>Error!</div>;
      } else if (!props) {
        return <div>Loading...</div>;
      } else {
        return (
          <div>
            Products
            {props.products.map(({ name, description, imageUrl }) => (
              <div key={name}>
                <p>{name}</p>
                <p>{description}</p>
                <img width={200} height={200} src={imageUrl} />
              </div>
            ))}
          </div>
        );
      }
    }}
  />
);

export const route = {
  ...baseRoute,
  routeComponent: Route,
  component: Screen
};

export default Screen;
