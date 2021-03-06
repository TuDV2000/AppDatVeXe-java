package com.dvt.service.implement;

import com.dvt.pojos.Permission;
import com.dvt.repository.IPermissionRepository;
import com.dvt.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class PermissionService extends GenericsService<Permission> implements IPermissionService {

}
