package com.dvt.service.implement;

import com.dvt.pojos.Point;
import com.dvt.service.IPointService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PointService extends GenericsService<Point> implements IPointService {
}
