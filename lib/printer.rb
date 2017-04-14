require_relative 'printer/print_row_matrix'
require_relative 'printer/print_column_matrix'

class Printer
  STANDARD_IO = STDOUT

  def print_matrix(matrix, io = STANDARD_IO)
    self.class.print_row_matrix(matrix, io)
  end

  def print_row_matrix(row_matrix, io = STANDARD_IO)
    self.class.print_row_matrix(row_matrix, io)
  end

  def print_column_matrix(column_vector, io = STANDARD_IO)
    self.class.print_column_matrix(column_vector, io)
  end

  def self.print_matrix(matrix, io = STANDARD_IO)
    PrintRowMatrix.new(row_matrix: matrix, io: io).call
  end

  def self.print_row_matrix(row_matrix, io = STANDARD_IO)
    PrintRowMatrix.new(row_matrix: row_matrix, io: io).call
  end

  def self.print_column_matrix(column_matrix, io = STANDARD_IO)
    PrintColumnMatrix.new(column_matrix: column_matrix, io: io).call
  end
end
