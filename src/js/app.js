import React, { Component } from 'react';
import _ from 'lodash';
import Root from './root';
import Header from './header';
import Logo from './logo';
import MainNav from './main-nav';
import Content from './content';
import TitlesTable from './titles/table';
import Spinner from './spinner';

const deepMapKeys = function (object, fn) {
  if (_.isObject(object)) {
    return _.reduce(object, (memo, val, key) => {
      memo[fn(key)] = deepMapKeys(val, fn);
      return memo;
    }, {});
  } else if (_.isArray(object)) {
    return _.map(object, _.partialRight(deepMapKeys, fn));
  } else {
    return object;
  }
}


class App extends Component {
  state = {
    titles: [],
  }

  componentDidMount() {
    fetch('http://localhost:9292/api/v1/titles')
      .then(response => response.json())
      .then(x => {
        console.log("JSON:", x);
        return x;
      })
      .then(x => {
        return deepMapKeys(x, _.camelCase);
      })
      .then(x => {
        console.log("camelcased:", x);
        return x;
      })
      .then(({titles}) => this.setState({ titles }));
  }

  render() {
    return (
      <Root>
        <Header>
          <Logo/>
          <MainNav/>
        </Header>
        <Content>
          {this.state.titles ?
              <TitlesTable titles={this.state.titles}/> :
              <Spinner/>
          }
        </Content>
      </Root>
    );
  }
}

export default App;
