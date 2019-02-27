import React, { Component } from 'react';
import _ from 'lodash';

class Table extends Component {
  render() {
    const { records, schema } = this.props;
    const ths = _.map(_.keys(schema.columns), (columnName, i) => {
      return <th key={i}>{columnName}</th>;
    });
    const trs = _.map(records, (record, i) => {
      const tds = _.map(schema.columns, (fn, name) => {
        return <td key={name}>{fn(record)}</td>;
      });
      return <tr key={i}>{tds}</tr>;
    });

    return (
      <table>
        <thead>
          <tr>{ths}</tr>
        </thead>
        <tbody>{trs}</tbody>
      </table>
    );
  }
}

export default Table;
