package com.dvt.repository.implement;

import com.dvt.pojos.Point;
import com.dvt.repository.IPointRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class PointRepository extends GenericsRepository<Point> implements IPointRepository {
}
