def SplitGroup(group)
  $group_suits.clear()
  $group_ranks.clear()
  group.each do |card|
    if (!card.include?'1j' and !card.include?'2j')
      if(card.length == 2)
        $group_ranks << card.split('')[0]
        $group_suits << card.split('')[1]
      else
        $group_ranks << card.split('')[0] + card.split('')[1]
        $group_suits << card.split('')[2]
      end
    end
  end
end

def SequentialGroup(group)
  if(group.size == 1)
    return true
  end
  if($group_ranks.index('A')==0)
    if(($ranks.index('A').to_i - $ranks.index($group_ranks[1]).to_i).abs != 12 and ($ranks.index('A').to_i - $ranks.index($group_ranks[1]).to_i).abs != 1)
      return false
    end
  elsif ($group_ranks.index('A')==$group_ranks.size-1)
    if(($ranks.index('A').to_i - $ranks.index($group_ranks[$group_ranks.index('A')-1]).to_i).abs != 12 and ($ranks.index('A').to_i - $ranks.index($group_ranks[$group_ranks.index('A')-1]).to_i).abs != 1)
      return false
    end
  end
  $group_ranks.delete('A')

  i = -1
  loop do
    i +=1
    if i == $group_ranks.length-1
      break
    end
    if(($ranks.index($group_ranks[i]).to_i - $ranks.index($group_ranks[i+1]).to_i).abs != 1)
      return false
    end
  end
  return true
end

#Sequence
def CheckSequence(group)
  SplitGroup(group)
  if($group_suits.size > 1) #must be one suit to accomplish a sequential group
    return false
  end
  if(group.include?'1j')
    if(group.index('1j') == 0 or group.index('1j') == group.size-1) #the joker is at first or last index
      if(group.index('1j') == 0)
        if(group[group.index('1j')+1].include?'A')
          return false
        end
      end
        if(group.index('1j') == group.size-1)
          if(group[group.index('1j')-1].include?'A')
            return false
          end
        end
        if(!SequentialGroup($group_ranks))
          return false
        end
      return true
    else #the joker is at the middle
      if(group[group.index('1j')+1].include?'A')
        if($ranks.index(group[group.index('1j')-1].split("")[0]) != 1 and $ranks.index(group[group.index('1j')-1].split("")[0]) != 10)
          return false
        end
        if(group.size > 3)
          if(!SequentialGroup(group[0..group.index('1j')-1]))
            return false
          end
          if(!SequentialGroup(group[group.index('1j')+1..group.size-1]))
            return false
          end
        end
      elsif(group[group.index('1j')-1].include?'A')
        if($ranks.index(group[group.index('1j')+1].split("")[0]) != 1 and $ranks.index(group[group.index('1j')+1].split("")[0]) != 10)
          return false
        end
        if(group.size > 3)
          SplitGroup(group[0..group.index('1j')-1])
          if(!SequentialGroup(group[0..group.index('1j')-1]))
            return false
          end
          SplitGroup(group[group.index('1j')+1..group.size-1])
          if(!SequentialGroup(group[group.index('1j')+1..group.size-1]))
            return false
          end
        end
        return true
      else
        if(($ranks.index(group[group.index('1j')+1].split("")[0]) - $ranks.index(group[group.index('1j')-1].split("")[0])).abs != 2)
          return false
        end
          if(group.size > 3)
            SplitGroup(group[0..group.index('1j')-1])
            if(!SequentialGroup(group[0..group.index('1j')-1]))
              return false
            end
            SplitGroup(group[group.index('1j')+1..group.size-1])
            if(!SequentialGroup(group[group.index('1j')+1..group.size-1]))
              return false
            end
          end
          return true
        end
      end
    elsif(group.include?'2j')
      if(group.index('2j') == 0 or group.index('2j') == group.size-1) #the joker is at first or last index
        if(group.index('2j') == 0)
          if(group[group.index('2j')+1].include?'A')
            return false
          end
        end
          if(group.index('2j') == group.size-1)
            if(group[group.index('2j')-1].include?'A')
              return false
            end
          end
          if(!SequentialGroup($group_ranks))
            return false
          end
        return true
      else #the joker is at the middle
        if(group[group.index('2j')+1].include?'A')
          if($ranks.index(group[group.index('2j')-1].split("")[0]) != 1 and $ranks.index(group[group.index('2j')-1].split("")[0]) != 10)
            return false
          end
          if(group.size > 3)
            if(!SequentialGroup(group[0..group.index('2j')-1]))
              return false
            end
            if(!SequentialGroup(group[group.index('2j')+1..group.size-1]))
              return false
            end
          end
        elsif(group[group.index('2j')-1].include?'A')
          if($ranks.index(group[group.index('2j')+1].split("")[0]) != 1 and $ranks.index(group[group.index('2j')+1].split("")[0]) != 10)
            return false
          end
          if(group.size > 3)
            SplitGroup(group[0..group.index('2j')-1])
            if(!SequentialGroup(group[0..group.index('2j')-1]))
              return false
            end
            SplitGroup(group[group.index('2j')+1..group.size-1])
            if(!SequentialGroup(group[group.index('2j')+1..group.size-1]))
              return false
            end
          end
          return true
        else
          if(($ranks.index(group[group.index('2j')+1].split("")[0]) - $ranks.index(group[group.index('2j')-1].split("")[0])).abs != 2)
            return false
          end
            if(group.size > 3)
              SplitGroup(group[0..group.index('2j')-1])
              if(!SequentialGroup(group[0..group.index('2j')-1]))
                return false
              end
              SplitGroup(group[group.index('2j')+1..group.size-1])
              if(!SequentialGroup(group[group.index('2j')+1..group.size-1]))
                return false
              end
            end
            return true
          end
        end
      else
        if(!SequentialGroup(group))
          return false
        end
        return true
      end
    end

#Validate the group of cards
def GeneralValidation(group)
#check length
  if (group.size <= 2 or group.size > 13)
    return false
  end
#check jokers
  if (group.include?'1j' and group.include?'2j')
    return false
  end
  return true
end

#cards of the same rank
def CheckSameRank(group)
  SplitGroup(group)
  group_ranks_set=Set.new #must be only one rank
  group.each do |card|
    if (!card.include?'j')
    group_ranks_set << card.split('')[0]
    end
  end

#delete jokers
  if(group.include?'1j')
    group.delete('1j')
  end
  if(group.include?'2j')
    group.delete('2j')
  end

#validation
  if($group_suits.size==group.size)
    if(group_ranks_set.size==1)
      return true
    end
  end
  return false
end
