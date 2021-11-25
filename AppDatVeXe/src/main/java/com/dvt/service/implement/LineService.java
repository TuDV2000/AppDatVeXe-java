package com.dvt.service.implement;

import com.dvt.pojos.Line;
import com.dvt.pojos.Point;
import com.dvt.repository.ILineRepository;
import com.dvt.service.ILineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class LineService extends GenericsService<Line> implements ILineService {
    @Autowired
    ILineRepository lineRepository;

    @Override
    public Map<Point, List<Line>> getAllLines() {
        return lineRepository.getAllLines();
    }

    @Override
    public List<Line> getLinesBySPoint(int idSPoint) {
        return lineRepository.getLinesBySPoint(idSPoint);
    }

    @Override
    public Line getLine(int sPointId, int ePointId) {
        return lineRepository.getLine(sPointId, ePointId);
    }

    @Override
    public List<Line> getPopularLine(){
        return lineRepository.getPopularLine();
    }

    @Override
    public List<Line> getOnlyLines(){return  lineRepository.getAll();};

    @Override
    public boolean createLine(Line line){return lineRepository.createLine(line);};
}
