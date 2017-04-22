#!/usr/bin/env ruby

require './lib/abstract_call'
require './lib/advanced_math'
require './lib/printer'
require './lib/timer'
require './lib/generate_self_incrementing_vector_elements'
require './lib/generate_self_incrementing_matrix_elements'
require './lib/generate_symmetric_toeplitz_matrix_elements'

include AdvancedMath
include AdvancedMath::LUDecomposition

size = 10

vector_elements = GenerateSelfIncrementingVectorElements.new(
  first_element: 1.0, # FLOAT AS INPUT DATA !!!
  size: size
).call

matrix_elements = GenerateSymmetricToeplitzMatrixElements.new(
  first_row_elements: vector_elements
).call

square_row_matrix = SquareRowMatrix.new(rows: matrix_elements)
column_vector     = ColumnVector.new(elements: vector_elements)

sle_solution = nil

execution_time = Timer.new {
  sle_solution = SLE.new(
    matrix: square_row_matrix,
    vector: column_vector
  ).solve_by_kij_form_of_lu_decomposition
}.execution_time

puts "Execution time of sequential kij form of lu decomposition:"
puts execution_time
