require_relative '../lib/cart.rb'



describe Cart do
  before do
    @cart = Cart.new
  end

  context "第一種情境：不打折" do
    it '第一集買一本' do
      @cart.add({ "1st": 1, "2nd": 0, "3rd": 0, "4th": 0, "5th": 0})
      expect(@cart.calculate).to eq(100)
    end

    it '第一集買三本' do
      @cart.add({ "1st": 3, "2nd": 0, "3rd": 0, "4th": 0, "5th": 0})
      expect(@cart.calculate).to eq(300)
    end
  end

  context "第二種情境：兩本不同 打5%折扣" do
    it '第一集買一本 第二集買一本' do
      @cart.add({ "1st": 1, "2nd": 1, "3rd": 0, "4th": 0, "5th": 0})
      expect(@cart.calculate).to eq(190)
    end

    it '第一集買兩本 第二集買兩本' do
      @cart.add({ "1st": 2, "2nd": 2, "3rd": 0, "4th": 0, "5th": 0})
      expect(@cart.calculate).to eq(380)
    end

    it '第一集買一本 第二集買兩本' do
      @cart.add({ "1st": 1, "2nd": 2, "3rd": 0, "4th": 0, "5th": 0})
      expect(@cart.calculate).to eq(290)
    end

    it '第一集買兩本 第二集買三本' do
      @cart.add({ "1st": 2, "2nd": 3, "3rd": 0, "4th": 0, "5th": 0})
      expect(@cart.calculate).to eq(480)
    end
  end

  context "第三種情境：三本不同 打10%折扣" do
    it '第一集買一本 第二集買一本 第三集買一本' do
      @cart.add({ "1st": 1, "2nd": 1, "3rd": 1, "4th": 0, "5th": 0})
      expect(@cart.calculate).to eq(270)
    end

    it '第一集買兩本 第二集買兩本 第四集買兩本' do
      @cart.add({ "1st": 2, "2nd": 2, "3rd": 0, "4th": 2, "5th": 0})
      expect(@cart.calculate).to eq(540)
    end

    it '第一集買一本 第二集買兩本 第五集買四本' do
      @cart.add({ "1st": 1, "2nd": 2, "3rd": 0, "4th": 0, "5th": 4})
      expect(@cart.calculate).to eq(270+190+200)
    end
  end

  context "第四種情境：四本不同 打15%折扣" do
    it '第一集買一本 第二集買兩本 第四集買四本 第五集買七本' do
      @cart.add({ "1st": 1, "2nd": 2, "3rd": 0, "4th": 4, "5th": 7})
      expect(@cart.calculate).to eq(340+270+380+300)
    end
  end
  
end
