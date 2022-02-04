-- ============================================================= --
-- Better Placeable Sell Prices
-- Curato Farms
--gracePeriod = number of months
-- ============================================================= --



function EconomyManager:getSellPrice(object)
    gracePeriod = 0.1 
	
    if placeableId ~= nil and object.age < gracePeriod then
        return object.price
    end
    

    if object.getSellPrice ~= nil then
        return object:getSellPrice()
    end

    return math.floor(object.price * 0.5)
end


function Placeable:getSellPrice()
    gracePeriod = 0.1 
    if self.age < gracePeriod then
        return self.price
    end
	
	
    local priceMultiplier = 0.8
    
    local maxAge = self.storeItem.lifetime

    if maxAge ~= nil and maxAge ~= 0 then
        priceMultiplier = priceMultiplier * math.exp(-3.5 * math.min(self.age / maxAge, 1))
    end

    return math.floor(self.price * math.max(priceMultiplier, 0.05))
end


