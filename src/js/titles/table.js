import React, { Component } from 'react';
import _ from 'lodash';
import Table from '../table';

const schema = {
  columns: {
    "Name": _.property("name"),
  },
};

class TitlesTable extends Component {
  render() {
    return (
      <Table records={this.props.titles} schema={schema}/>
    );
  }
}

export default TitlesTable;
