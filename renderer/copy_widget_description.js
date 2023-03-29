const description = document.querySelector("#dartdoc-main-content > section.desc.markdown");
const content = description.innerHTML;
setTimeout(async () => {
  await window.navigator.clipboard.writeText(content);
  console.log('Text copied to the clipboard!');
}, 3000)