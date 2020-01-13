require 'Set'
require 'test/unit/assertions'

$suits = Array.new(['h', 's', 'c', 'd'])
$ranks = Array.new(['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'])
puts "please enter a group of cards in the form of card,card,card,..."
group = Array.new
user_input=gets.chomp()
group = user_input.split(/,/)

$group_suits=Set.new
$group_ranks=Array.new

def CheckJokers(group)
  if(group.include?'1j' and group.include?'2j')
    return false
  elsif(group.include?'1j')
      if($group_suits.size == 1)
        if(group.index('1j') == 0 or group.index('1j') == group.size-1) #the joker is at first or last index
          if(group[group.index('1j')+1].include?'A' or group[group.index('1j')-1].include?'A')
            return false
          else
            group.delete('1j')
            CheckSequence(group)
          end
        else #joker is at the middle
          if(group[group.index('1j')+1].split("")[0] == 'A')
            if($ranks.index(group[group.index('1j')-1].split("")[0]) == 1 or $ranks.index(group[group.index('1j')-1].split("")[0]) == 10)
              group.delete('1j')
              if(group.size > 2)
                if(CheckSequence(group[0..group.index('1j')-1]))
                  CheckSequence(group[group.index('1j')+1..group.size-1])
                else
                  return false
                end
              else
                return true
              end
            else
              return false
            end
          elsif (group[group.index('1j')-1].split("")[0] == 'A')
            if($ranks.index(group[group.index('1j')+1].split("")[0]) == 1 or $ranks.index(group[group.index('1j')+1].split("")[0]) == 10)
              group.delete('1j')
              if(group.size > 2)
                if(CheckSequence(group[0..group.index('1j')-1]))
                  CheckSequence(group[group.index('1j')+1..group.size-1])
                else
                  return false
                end
              else
                return true
              end
              #CheckSequence if group size is bigger than 2 else just return true
            else
              return false
            end
        else
          if(($ranks.index(group[group.index('1j')+1].split("")[0]) - $ranks.index(group[group.index('1j')-1].split("")[0])).abs == 2)
            if(group.size > 3)
              if(CheckSequence(group[0..group.index('1j')-1]))
                CheckSequence(group[group.index('1j')+1..group.size-1])
                group.delete('1j')
              else
                return false
              end
            else
              return true
            end
            else
              return false
            end
        end
      end
    else if($group_suits.size >= 2 and group.size < 5)
        group.delete('1j')
        CheckSameRank(group)
      else
        return false
      end
    end
  elsif(group.include?'2j')
    if($group_suits.size == 1)
      if(group.index('2j') == 0 or group.index('2j') == group.size-1) #the joker is at first or last index
        if(group[group.index('2j')+1].include?'A' or group[group.index('2j')-1].include?'A')
          return false
        else
          group.delete('2j')
          CheckSequence(group)
        end
      else #joker is at the middle
        if(group[group.index('2j')+1].split("")[0] == 'A')
          if($ranks.index(group[group.index('2j')-1].split("")[0]) == 1 or $ranks.index(group[group.index('2j')-1].split("")[0]) == 10)
            group.delete('2j')
            if(group.size > 2)
              if(CheckSequence(group[0..group.index('2j')-1]))
                CheckSequence(group[group.index('2j')+1..group.size-1])
              else
                return false
              end
            else
              return true
            end
            #CheckSequence if group size is bigger than 2 else just return true
          else
            return false
          end
        elsif (group[group.index('2j')-1].split("")[0] == 'A')
          if($ranks.index(group[group.index('2j')+1].split("")[0]) == 1 or $ranks.index(group[group.index('2j')+1].split("")[0]) == 10)
            group.delete('2j')
            if(group.size > 2)
              if(CheckSequence(group[0..group.index('2j')-1]))
                CheckSequence(group[group.index('2j')+1..group.size-1])
              else
                return false
              end
            else
              return true
            end
            #CheckSequence if group size is bigger than 2 else just return true
          else
            return false
          end
      else
        if(($ranks.index(group[group.index('2j')+1].split("")[0]) - $ranks.index(group[group.index('2j')-1].split("")[0])).abs == 2)
            if(CheckSequence(group[0..group.index('2j')-1]))
              CheckSequence(group[group.index('2j')+1..group.size-1])
            else
              return false
            end
          else
            return false
        end
      end
    end
    elsif($group_suits.size > 1 and group.size < 5)
      group.delete('2j')
      CheckSameRank(group)
    end
  end
end

def CheckAces(group)
  if($group_ranks.index('A')==0)
    if(($ranks.index('A').to_i - $ranks.index($group_ranks[1]).to_i).abs == 12 or ($ranks.index('A').to_i - $ranks.index($group_ranks[1]).to_i).abs == 1)
      $group_ranks.delete('A')
        if(CheckSequence($group_ranks))
          return true
        else
          return false
        end
    else
      return false
    end
  else if ($group_ranks.index('A')==$group_ranks.length-1)
    if(($ranks.index('A').to_i - $ranks.index($group_ranks[$group_ranks.index('A')-1]).to_i).abs == 12 or ($ranks.index('A').to_i - $ranks.index($group_ranks[$group_ranks.index('A')-1]).to_i).abs == 1)
      $group_ranks.delete('A')
        if(CheckSequence($group_ranks))
          return true
        else
          return false
        end
    else
      return false
    end
  else
    return false
  end
end
end

def CheckSequence(group)
  if(group.size == 1)
    return true
  else
  if ($group_ranks.include?'A')
    if(CheckAces(group))
      return true
    end
    else
  i = -1
  loop do
    i +=1
    if i == $group_ranks.length-1
      break
    end
    if(($ranks.index($group_ranks[i]).to_i - $ranks.index($group_ranks[i+1]).to_i).abs == 1)
      return true
    else
      return false
    end
  end
end
end
end

def CheckSameRank(group)
  group_ranks_set=Set.new
  group.each do |card|
    if (!card.include?'j')
    group_ranks_set << card.split('')[0]
    end
  end

  if($group_suits.size==group.size)
    if(group_ranks_set.size==1)
      return true
    else
      return false
    end
  else
    return false
  end
end

def CheckLength(group)
  if(group.length>=3 and group.length<=13)
    return true
  else
    return false
  end
end

def validgroup(group)
  if(CheckLength(group))
    group.each do |card|
      if (!card.include?'j')
      $group_ranks << card.split('')[0]
      $group_suits << card.split('')[1]
      end
    end
    if($group_suits.size==1)
      if (group.include?'1j' or group.include?'2j')
        if(CheckJokers(group))
          return true
        else
          return false
        end
      elsif ($group_ranks.include?'A')
        if(CheckAces(group))
          return true
        else
          return false
        end
    else
      CheckSequence(group)
    end
  else
    if($group_suits.size>=2)
      if (group.include?'1j' or group.include?'2j')
        if(CheckJokers(group))
          return true
        else
          return false
        end
      else
        return CheckSameRank(group)
      end
    end
    end
  else
    return false
  end
end

puts validgroup(group)
