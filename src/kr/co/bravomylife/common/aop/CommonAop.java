package kr.co.bravomylife.common.aop;

import java.text.DecimalFormat;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Aspect
public class CommonAop {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(CommonAop.class);
	
	/**
	 * @since 2024-09-30
	 * <p>DESCRIPTION: kr.co.bravomylife 하위 패키지 내의 모든 컨트롤러 파일의 메소드(* kr.co.bravomylife..*Web.*(..) || * kr.co.bravomylife..*Api*(..))에 실행 시간(timeTarget())을 설정(전체 인수 포함)</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:<br>
	 * <code>@Pointcut("execution(* kr.co.bravomylife.backoffice.config.dao.ManagerDao.*(..))")</code><br>
	 * <code>@Pointcut("execution(* kr.co.bravomylife..*Dao.*(..))")</code><br>
	 * <code>@Pointcut("execution(* kr.co.bravomylife..controller.*Ctrl.*(..)) || execution(* kr.co.bravomylife..service.*Impl.*(..)) || execution(* kr.co.bravomylife..dao.*Dao.*(..))")</code><br>
	 * </p>
	 */
	@Pointcut("execution(* kr.co.bravomylife..*Web.*(..)) || execution(* kr.co.bravomylife..*Api.*(..))")
	private void controllerTarget(){}
	
	/**
	 * @param joinPoint [JOIN POINT]
	 * @throws Throwable [Throwable]
	 * @return Object
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: 상기 지정된 모든 메소드의 실행 시간 추적 로깅(logger)</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입 및 형식을 만족하여야 한다.</p>
	 * <p>EXAMPLE:</p>
	 */
	@Around("controllerTarget()")
	public Object invoke(ProceedingJoinPoint joinPoint) throws Throwable {
		
		/** 메소드 실행 전 공통 기능 */
		long startTime		= System.currentTimeMillis();				// 시작 시각
		String methodName	= joinPoint.getSignature().toString();		// 호출되는 메소드명
		
		/**  메소드 실행 */
		Object returnValue 	= joinPoint.proceed(); 						// 메소드 호출(returnValue는 해당 메소드의 실행 결과)
		
		/** 메소드 실행 후 공통 기능 */
		long endTime		= System.currentTimeMillis();				// 종료 시작
		long executeTime	= endTime - startTime;						// 실행 시간(초): 종료 시작 - 시작 시각
		
		DecimalFormat df = new DecimalFormat("#,###0.000");
		if (executeTime / 1000.0 >= 3) {
			logger.warn("[%EXECUTE_TIME(Over 3s)%][" + methodName + "] " + df.format((executeTime / 1000.0)) + "s");
		}
		else {
			// logger.debug("[%EXECUTE_TIME%][" + methodName + "] " + df.format((executeTime / 1000.0)) + "s");
		}
		
		return returnValue;
	}
}