module AdvancedMath
  class RowMatrix < AbstractMatrix
    attr_reader :rows

    def initialize(rows = nil, **attrs_hash)
      @rows = rows || attrs_hash[:rows]
    end

    def row_size
      @row_size ||= rows.size
    end

    def column_size
      @column_size ||= rows[0].size
    end

    def [](index)
      rows[index]
    end

    def to_a
      rows
    end

    def to_h
      { rows: rows }
    end
  end
end
