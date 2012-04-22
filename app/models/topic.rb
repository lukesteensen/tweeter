class Topic

  attr_accessor :string, :score

  def self.all
    topics = []
    @trends = $redis.smembers('trends')
    @trends.each do |t|
      $redis.smembers(t).each do |m|
        if Time.now.to_i - m.split(':').last.to_i > 20.seconds.to_i
          $redis.srem(t, m)
        end
      end
      top = Topic.new
      top.string = t
      top.score = $redis.scard(t)
      if $redis.scard(t) == 0
        $redis.srem('trends', t)
      else
        topics << top
      end
    end
    topics.sort_by{|s| s.score}.reverse
  end

  def self.vote(s)
    $redis.sadd('trends', s)
    $redis.sadd(s, s + ':' << Time.now.to_i.to_s)
  end

end
