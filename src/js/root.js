import React, { Component } from 'react';

class Root extends Component {
  render() {
    return (
      <div className="l_root">
        {this.props.children}
      </div>
    );
  }
}

export default Root;
