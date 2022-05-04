class TransactionSearchService
  def self.search(curr_transaction, query)
    curr_transaction.where("type_transaction like '%#{query}%'")
  end
end