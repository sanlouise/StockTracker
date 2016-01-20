class Stock < ActiveRecord::Base
  
  has_many :user_stocks
  has_many :users, through: :user_stocks
  
  # Find By Ticker Method
  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end
  
  # New From Lookup Method
  def self.new_from_lookup(ticker_symbol)
    looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
    return nil unless looked_up_stock.name
    
    new_stock = new(ticker: looked_up_stock.symbol, name: looked_up_stock.name)
    new_stock.last_price = new_stock.price
    new_stock
  end
  
  # Price Method
  def price
    closing_price = StockQuote::Stock.quote(ticker).close
    return "#{closing_price} (Closing)" if closing_price
    
    opening_price = StockQuote::Stock.quote(ticker).open
    return "#{opening_price} (Opening)" if opening_price
    'Unavailable'
  end
  
  # Change Realtime Method
  def change_realtime
    change_realtime = StockQuote::Stock.quote(ticker).change_realtime
    return change_realtime if change_realtime
  end
  
end
