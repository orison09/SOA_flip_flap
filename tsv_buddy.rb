# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  attr_accessor :data

  def take_tsv(tsv)
    @data = []
    results = []
    lines = tsv.split("\n")
    keys = lines[0].split("\t")
    lines.shift
    lines.each do |line|
      results << keys.zip(line.split("\t")).to_h
      @data = results
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    newt = ''
    newt << @data[0].keys.join("\t") + "\n"
    0.upto(data.count - 1) do |i|
      newt << @data[i].values.join("\t") + "\n"
    end
    newt
  end
end
