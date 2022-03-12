
public aspect TraceAspectAli {
	pointcut classToTrace(): within(ComponentApp) || within(DataApp)
							|| within(ServiceApp) || within(Program);
	
	pointcut methodToTrace(): classToTrace() && execution(String getName());
	
	before(): methodToTrace() {
		String before = thisJoinPointStaticPart.getSignature() + ", "
				+ thisJoinPointStaticPart.getSourceLocation().getLine();
		System.out.println("\t-->" + before);
	}
	
	after(): methodToTrace() {
		System.out.println("\t<--" + thisJoinPointStaticPart.getSourceLocation().getFileName());
	}
}

