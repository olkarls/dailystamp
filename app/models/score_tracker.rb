class ScoreTracker
  attr_reader :score
  
  def initialize
    @score = 0
    @positive_points = 0
    @negative_points = 0
    @position = 0
  end
  
  def mark
    @negative_points = 0
    if @position >= @positive_points
      @positive_points += 1
      @position = 0
    end
    @position += 1
    @score += @positive_points
    @positive_points
  end
  
  def skip
    # keep scores as they are
    0
  end
  
  def miss
    @position = 0 if @negative_points.zero?
    if @position == @negative_points
      @positive_points -= 1 unless @positive_points.zero?
      @negative_points += 1
      @position = 0
    end
    @position += 1
    @score -= @negative_points
    if @score < 0
      @position = 0
      @score = 0
    else
      -@negative_points
    end
  end
end