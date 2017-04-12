class PrintRowMatrix
  # TODO FORMAT_STRING

  attr_reader :io, :row_matrix

  # TODO Extract method
  def initialize(attrs)
    @io         = attrs[:io] || STDOUT
    @row_matrix = attrs[:row_matrix]
  end

  def call
    row_matrix.rows.each do |row|
      io.print row
      io.puts
    end
  end
end
