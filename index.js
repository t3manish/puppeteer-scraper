const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch({
    args: ['--no-sandbox', '--disable-setuid-sandbox'], // Add these arguments
    headless: true
  });

  const page = await browser.newPage();
  await page.goto('https://example.com');
  const title = await page.title();

  console.log(`Title of the page: ${title}`);

  await browser.close();
})();

