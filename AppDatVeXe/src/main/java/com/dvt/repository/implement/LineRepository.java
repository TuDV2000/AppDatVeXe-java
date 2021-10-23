package com.dvt.repository.implement;

import com.dvt.pojos.Line;
import com.dvt.pojos.Point;
import com.dvt.repository.ILineRepository;
import com.dvt.repository.IPointRepository;
import com.dvt.service.IPointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.NoResultException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Repository
@Transactional
public class LineRepository extends GenericsRepository<Line> implements ILineRepository {
    @Autowired
    IPointRepository pointRepository;

    @Override
    public Map<Point, List<Line>> getAllLines() {
        Map<Point, List<Line>> allLines = new HashMap<>();
        List<Point> lPoints = pointRepository.getAll();
        System.out.println("List<Point>: " + lPoints);
        for (Point p: lPoints) {
            List<Line> lLines = getLinesBySPoint(p.getId());
            if (lLines.size() > 0) {
                System.out.println("List<Line>: " + lLines);
                allLines.put(p, lLines);
            }
        }
        return allLines;
    }

    @Override
    public List<Line> getLinesBySPoint(int idSPoint) {
        if (idSPoint > 0) {
            String hql = "from Line where startPoint.id = :idSPoint";

            return getCurrentSession().createQuery(hql)
                    .setParameter("idSPoint", idSPoint).getResultList();
        }
        return null;
    }

    @Override
    public Line getLine(int sPointId, int ePointId) {
        if (sPointId != 0 && ePointId != 0) {
            try {
                String hql1 = "from Line where startPoint.id = :idSPoint and endPoint.id = :idEPoint";
                Line l = (Line) getCurrentSession().createQuery(hql1)
                        .setParameter("idSPoint", sPointId)
                        .setParameter("idEPoint", ePointId)
                        .getSingleResult();
                if (l != null)
                    return l;
            } catch (NoResultException ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }
}
