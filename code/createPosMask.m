function [posMask] = createPosMask(tgtPos, params, trainData, curMask)
  if params.predictPos
    curPosOutput = trainData.posOutput(:, tgtPos)';
    posMask.mask = curMask.mask & curPosOutput~=params.nullPosId & curPosOutput~=params.tgtEos;
  else
    posMask.mask = curMask.mask;
  end
  posMask.unmaskedIds = find(posMask.mask);
  posMask.maskedIds = find(~posMask.mask);
end