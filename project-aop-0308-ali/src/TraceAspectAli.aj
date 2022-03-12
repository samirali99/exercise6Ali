
public aspect TraceAspectAli {
	pointcut classToTrace(): within(ComponentApp) || within(DataApp)
							|| within(ServiceApp);
	
	pointcut methodToTrace(): classToTrace() && execution();
	
	
	before(): methodToTrace() {
		String before = thisJoinPointStaticPart.getSignature() + ", "
				+ thisJoinPointStaticPart.getSourceLocation().getLine();
		System.out.println("\t-->" + before);
	}
	
	after(): methodToTrace() {
		System.out.println("\t<--" + thisJoinPointStaticPart.getSourceLocation().getFileName());
	}
}
