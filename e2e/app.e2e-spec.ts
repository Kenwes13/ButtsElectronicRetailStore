import { ButtElectStorePage } from './app.po';

describe('butt-elect-store App', function() {
  let page: ButtElectStorePage;

  beforeEach(() => {
    page = new ButtElectStorePage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
