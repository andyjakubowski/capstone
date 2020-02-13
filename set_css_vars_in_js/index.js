const template = document.getElementById('color-box');
const templateContent = template.content;
const root = document.documentElement;
let data;

const headers = new Headers({ 'Origin': 'http://localhost:4567/' });
fetch('http://localhost:4567/', { headers: headers })
  .then((res) => res.json())
  .then((jsonData) => {
    data = jsonData;
    updateCSSProps(jsonData);
    // render(jsonData);
  });

function updateCSSProps(props) {
  props.forEach(({ name, value }) => {
    root.style.setProperty(`--local-${name}`, value);
  });
}

function render(data) {
  data.forEach((colorObject) => {
    const clone = templateContent.cloneNode(true);
    const article = clone.querySelector('article');
    const heading = clone.querySelector('h1');
    article.style.backgroundColor = Object.values(colorObject)[0];
    heading.textContent = Object.keys(colorObject)[0];
    document.body.append(clone);
  });
}
