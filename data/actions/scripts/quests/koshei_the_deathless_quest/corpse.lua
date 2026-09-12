function onUse(cid, item, fromPosition, itemEx, toPosition)
    doRemoveItem(item.uid)
    doSummonCreature("Koshei The Deathless", toPosition)

    return true
end