// Entry point for the build script in your package.json

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "./channels"
import * as React from 'react';
import * as ReactDOM from 'react-dom';

Rails.start()
Turbolinks.start()
ActiveStorage.start()

const hello = <div>Hello</div>;
const container = document.querySelector('#reactContainer');

const root = ReactDOM.createRoot(container);
root.render(hello);
